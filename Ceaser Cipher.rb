#Ceaser cipher Using Alphabet

word = "What a string!"
shift = 5
l_alphabet = *("a".."z")
u_alphabet = *("A".."Z")

ceaser = ""

word.each_char do |n|
  if n==" "
    ceaser += " "
  elsif l_alphabet.include?(n)
    old_index = l_alphabet.find_index(n)
    new_index = (old_index + shift) % l_alphabet.count
    value= l_alphabet[new_index]
    ceaser += value
  elsif u_alphabet.include?(n)
    old_index = u_alphabet.find_index(n)
    new_index = (old_index + shift) % u_alphabet.count
    value= u_alphabet[new_index]
    ceaser += value
  else
    ceaser += n
  end
end

puts ceaser

#Ceaser cyper using Unicode Character
word = "whats a string!"
lnt = word.length-1
num = 5
encrypt_word = ""
for i in 0..lnt
  if word[i] == " "
    encrypt_word += word[i]
  else
    char = word[i]
    order = char.ord
    num = order + 5
    e_char = num.chr
    encrypt_word += e_char

  end
end

puts encrypt_word
