require 'json'

class Saver
  def self.read_stats(filename)
    file = File.read(filename)
    JSON.parse(file)
  end

  def self.save_stats(stats, filename)
    file = File.open(filename, 'w')
    file.write(JSON.dump(stats))
    file.close
  end

  def self.saver(stats, choice)
    filename = ''
    loop do
      puts('Введите имя пользователя')
      filename = "./resources/#{$stdin.gets.strip}.json"
      break unless !File.file?(filename) && (choice == 9)

      puts('Такого пользователя не существует')
    end
    if choice == 9
      read_stats(filename)
    else
      save_stats(stats, filename)
      stats
    end
  end
end
