require_relative 'valera'

class Viewer
  def print_actions(actions_config)
    actions_config.each { |key| puts key['before_text'] }

    puts('8. Save game')
    puts('9. Load game')
    puts('10. Exit')
  end

  def print_stats(stats)
    puts("\nПараметры Валеры:")
    puts("Здоровье: #{stats['health']}")
    puts("Алкоголь: #{stats['mana']}")
    puts("Веселье: #{stats['fun']}")
    puts("Усталость: #{stats['tire']}")
    puts("Деньги: #{stats['money']}\n\n")
  end
end
