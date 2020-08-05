#!/usr/bin/lua5.3
--setup
note_lines = {}
tone_names = {'c','d','e','f','g','a','h','c','d','e','f','g','a','h'}
random_notes = {}
notes = ""
length = 82
num_notes = 20


--the rating limits the spreading of the notes
rating = 2
current_value = 7


math.randomseed(os.time())
math.random();math.random()


--initializing the board
function init_board()
  for i = 1,14,1
  do
    note_lines[i] = {}
    for j = 1,length,1
    do
      if(i % 2 == 0 and i <= 12 and i >= 3)
      then
        note_lines[i][j] = '-'
      else
        note_lines[i][j] = ' '
      end
    end
  end
end


--function to round numbers
function round(to_round)
  return math.floor(to_round + 0.5)
end


--function to regulate the spreading of the notes
function choose_next_note()
  current_value = ( round( math.random() ) == 0 ) and 
            ( current_value + math.random(0, rating) ) or
            ( current_value - math.random(0, rating) )
  return current_value
end


--function to if the value is valid
function not_zero(value)
  if(value % 14 == 0)
  then
    return 1
  else
    return value % 14
  end
end  


--main
while(1) do
  init_board()
  
  --choosing notes
  for i = 1,num_notes-1,1
  do
    random_notes[i] = not_zero(choose_next_note())   
    note_lines[15 - random_notes[i] ][ ( i * 4 ) - 1 ] = 'X'
    notes = notes .. tone_names[tonumber(random_notes[i])]
  end

  --printing everything
  for i = 1,14,1
  do
    if( rating >= 10 )
    then
      io.write(" |")
    else 
      io.write(tone_names[15 - i]..'|')
    end
    
    for j = 1,length,1
    do
      io.write(note_lines[i][j])
    end
    io.write("|\n")
  end
  
  io.write("\n->:")
  input = io.read()
  
  if(input == "exit")
  then
    break
  elseif (input == notes)
  then
    io.write("correct!\n your rating has improved\n")
    if(rating < 15) then rating = rating + 1 end
  else
    io.write("false!\n your rating has decreased\n")
    io.write("correct notes: "..notes)
    if(rating >= 0) then rating = rating - 1 end
  end
  notes = ""
end