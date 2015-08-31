# This is for Fighters only
# DICE ROLLING APP.
class DiceRoller

  #Adjust these to Match your Current Character Sheet
  CharacterName = "Broku Warhammer"

  # Attack Based Modifiers
  AttackBonus = 7
  NumberOfAttacks = 3
  InitiativeModifier = 0

  # Attribute Modifiers
  StrengthModifier = 4
  DexterityModifier = 0
  ConstitutionModifier = 3
  IntelligenceModifier = 0
  WisdomModifier = 0
  CharismaModifier = 0

  # Instance variable
  @running_total = 0
  @temp_roll = 0

  # House cleaning
  def reset
    @running_total = 0
    @temp_roll = 0
  end

  # Attack Actions
  def initiative
    d20 + InitiativeModifier
  end

  def full_attack
    reset
    NumberOfAttacks.times do
      attack_action
    end
    puts "Total Damage Done: #{@running_total}"
  end

  def attack_roll
    @temp_roll = d20
    puts "Base Roll was #{@temp_roll}"
    @temp_roll + AttackBonus
  end

  def damage
    total = 0
    total = d8 + StrengthModifier
    if crit?(@temp_roll)
      total += d8
      puts "CRITICAL HIT!!11!!"
    end
    @running_total += total
    total
  end

  def crit?(roll)
    roll == 19 || roll == 20
  end

  def attack_action
    temp_attack = attack_roll
    puts "#{CharacterName} Rolled a #{temp_attack} to hit"
    puts "if that hits it does #{damage} points of damage"
    puts ""
    temp_attack
  end

  # Ability Checks
  def strength_check
    d20 + StrengthModifier
  end

  def dexterity_check
    d20 + DexterityModifier
  end

  def constitution_check
    d20 + ConstitutionModifier
  end

  def intelligence_check
    d20 + IntelligenceModifier
  end

  def wisdom_check
    d20 + WisdomModifier
  end

  def charisma_check
    d20 + CharismaModifier
  end

  # Dice Declarations
  def d20
    rand(1..20)
  end

  def d12
    rand(1..12)
  end

  def d10
    rand(1..10)
  end

  def d8
    rand(1..8)
  end

  def d6
    rand(1..6)
  end

  def d4
    rand(1..4)
  end
end

def main
  dice = DiceRoller.new
  prompt = "> "
  print prompt

  while user_input = gets.chomp # loop while getting user input
    case user_input
    when "help"
      puts "You can use the following commands"
      puts "full_attack, attack_roll, damage, attack_action, initiative"
      puts "strength_check, dexterity_check, constitution_check, intelligence_check, wisdom_check, charisma_check"
      puts "d20, d12, d10, d8, d6, d4"
      break
    when "exit"
      abort("Leaving the program")
    else
      begin
        puts dice.method(user_input.to_sym).call
        print prompt
      rescue
        puts "Try Again"
        print prompt
      end
    end
  end

  main
end

puts "Welcome to D&D Helper"
main
