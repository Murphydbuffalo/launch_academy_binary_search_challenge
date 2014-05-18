MAX_VALUE = 300000000
MAX_TRIES = Math.log2(MAX_VALUE).ceil

hidden = rand(MAX_VALUE) + 1
checks_called = 0

define_method :check do |guess|
  checks_called += 1

  if checks_called > MAX_TRIES + 1
    raise "check called too many times"
  end

  if guess > hidden
    1
  elsif guess < hidden
    -1
  else
    0
  end
end

def guess_number(min, max)
  puts try = max/2
  attempt = check(try)
  until attempt == 0
    if attempt == -1 
      puts "Too low!"
      min = try #Doesn't matter if you increment min/max...
      puts try = min + ((max-min)/2) 
    else 
      puts "Too high!"
      max = try 
      puts try = min + ((max-min)/2) 
    end
    attempt = check(try) #Important to reassign attempt AFTER the adjustments made by the loop. Otherwise you may arrive at the
    #correct value, but have to loop one more time before attempt is given that correct value (which allows the loop to break)
  end   
  try
end

guess = guess_number(1, MAX_VALUE)

if guess == hidden
  puts "Guessed correctly!"
  exit 0
else
  puts "Invalid guess."
  exit 1
end