--setup
note_lines = {}
tone_names = {'c','d','e','f','g','a','h','c','d','e','f','g','a','h'}
random_notes = {}
notes = ""
num_notes = 10
math.randomseed(os.time())
math.random();math.random()
while(1) do
  --creating the lines
  for i = 1,14,1
  do
    note_lines[i] = {}
    for j = 1,42,1
    do
      if(i % 2 == 0 and i <= 12 and i >= 3)
      then
        note_lines[i][j] = '-'
      else
        note_lines[i][j] = ' '
      end
    
    end
  end


--choosing notes
  for i = 1,num_notes,1
  do
    random_notes[i] = math.random(1,14)
  
    note_lines[15 - random_notes[i] ][ ( i * 2 ) - 1] = 'X'
  
    notes = notes..tone_names[tonumber(random_notes[i])]
  end

--printing everything
  for i = 1,14,1
  do
    io.write(tone_names[15 - i]..'|')
    for j = 1,42,1
    do
      io.write(note_lines[i][j])
    end
    io.write('|')
    print()
  end
  io.write(" |1   5    10   15   20   25   30   35   40 |")
  print()
  io.write("  ")
  print(notes)
  print()

  input = io.read()
  if(input == "exit")
  then
    break
  elseif (input == notes)
  then
    print("yes")
  else
    print("no\n")
    print(notes)
  end
end