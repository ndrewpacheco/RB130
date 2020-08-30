require 'minitest/autorun'
require_relative 'cash_register.rb'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  # def test_accept_money
  #   cash_register = CashRegister.new(100)
  #   transaction = Transaction.new(25)
  #   transaction.amount_paid = 25

  #   previous_amount = cash_register.total_money
  #   cash_register.accept_money(transaction)
  #   current_amount = cash_register.total_money

  #   assert_equal previous_amount + 25, current_amount
  # end

  # # def change(transaction)
  # #   transaction.amount_paid - transaction.item_cost
  # # end

  # def test_change

  #   cash_register = CashRegister.new(100)
  #   transaction = Transaction.new(20)
  #   transaction.amount_paid = 30

  #   cash_register.accept_money(transaction)


  #   assert_equal 10, cash_register.change(transaction)

  # end

  # def test_give_receipt

  #   cash_register = CashRegister.new(100)
  #   transaction = Transaction.new(20)

  #   expected = "You've paid $20.\n"

  #   assert_output(expected) { cash_register.give_receipt(transaction) }


  # end


  def test_prompt_for_payment
    transaction = Transaction.new(50)

    input = StringIO.new("50\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)


    assert_equal(50, transaction.amount_paid )
  end

  # def prompt_for_payment(input: $stdin)
  # loop do
  #   puts "You owe $#{item_cost}.\nHow much are you paying?"
  #   @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
  #   break if valid_payment? && sufficient_payment?
  #   puts 'That is not the correct amount. ' \
  #        'Please make sure to pay the full cost.'
  # end

end