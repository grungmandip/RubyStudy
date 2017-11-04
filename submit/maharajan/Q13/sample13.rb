
class Check
  
  def self.run(form)
    userCheckAll = []
    begin
      form.each do |quest|
        userCheckAll << {
          name: quest[:name],
          input: question(quest)
        }
      end
    rescue => e
      puts "Error"
      return false
    end

    userCheckAll.each{ |a| puts "#{a[:name]} : #{a[:input]}" }
  end

  def self.question(form)
    text = input(form[:text])
    return text if validate(text, form[:regexp])
    puts "不正データ"
    question(form)
  end

  def self.validate(text, regexp)
    text =~ regexp
  end

  def self.input(text)
    puts text
    print "=>"
    i = $stdin.gets.chomp
    raise "exit" if i  == "exit"
    i
  end
  
end

client = [
  {
    name: "名前",
    text: "名前を入力",
    regexp: /\A@[A-Z]{3,}\z/
  },
  {
    name: "電話番号",
    text: "電話番号を入力",
    regexp: /\A([0-9]{3,})-([0-9]{4,})-([0-9]{4,})|([0-9]{4,})-([0-9]{3,})-([0-9]{3,})|([0-9]{3,})-([0-9]{3,})-([0-9]{4,})\z/
  },
  {
    name: "郵便番号",
    text: "郵便番号を入力",
    regexp: /\A[0-9]{7}\z|\A[0-9]{3}-[0-9]{4}\z/
  },
  {
    name: "メールアドレス",
    text: "メールアドレスを入力",
    regexp: /\A([\w+-_.!$#%])+@([\w+-_.!$#%])+\.([\w+-_.!$#%])+\z/
  }
]

Check.start(client)