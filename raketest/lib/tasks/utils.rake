namespace :utils do
  desc "Popular a tabela users com a quantidade selecionada"
  task setup_user: :environment do
  	if Rails.env.development?
  		if (ARGV.size == 2) && (ENV['qtd'] != "")
		    ENV['qtd'].to_i.times do |i|
		  	  user_name = Faker::Name.name
			    user_email = Faker::Internet.email
			    user = "#{user_name} - #{user_email}"
			    puts "Cadastrando o usuário: #{user}" 
		      User.create(name: user_name, email: user_email)
		    end
		  else
		  	puts "Informe a quantidade de usuários desejada."
		  	puts "Ex: rake utils:setup_user qtd=10"
		  end
	  else
	  	puts "Você não está em ambiente de desenvolvimento!"
	  end
  end
end
