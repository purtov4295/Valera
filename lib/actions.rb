require_relative 'valera'

class Actions
  attr_accessor :stats, :action_config

  def initialize; end

  def expr_exec(field, key)
    field.send key['operator'], key['value'].to_i
  end

  def effect_body_exec(effect_expr)
    if effect_expr.key?('conds') && cond_body_exec(effect_expr['conds'])
      effects_exec(effect_expr['effects'])
      return
    end
    field = effect_expr['field']
    @stats[field] = expr_exec(@stats[field], effect_expr)
  end

  def effects_exec(effects_body)
    effects_body.each { |key| effect_body_exec(key) }
  end

  def cond_body_exec(body)
    body.each { |key| return false unless expr_exec @stats[key['field']], key }
    true
  end

  def conds_exec
    if @action_config['conds'].nil?
      true
    else
      cond_body_exec(@action_config['conds'])
    end
  end

  def action_proc(stats, action_config)
    @action_config = action_config
    @stats = stats
    effects_exec(@action_config['effects']) if conds_exec
    @stats
  end
end
