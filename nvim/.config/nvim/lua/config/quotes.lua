local M = {}

M.quotes = {
  { "Talk is cheap. Show me the code.", "Linus Torvalds" },
  { "Intelligence is the ability to avoid doing work, yet getting the work done.", "Linus Torvalds" },
  { "The Linux philosophy is 'Laugh in the face of danger'. Oops. Wrong One. 'Do it yourself'. That's it.", "Linus Torvalds" },
  { "An idiot admires complexity, a genius admires simplicity.", "Terry Davis" },
  { "The purpose of a designer is to make the world a better place.", "Terry Davis" },
  { "The only way to do great work is to love what you do.", "Steve Jobs" },
  { "Stay hungry, stay foolish.", "Steve Jobs" },
  { "Simplicity is the ultimate sophistication.", "Leonardo da Vinci" },
  { "Premature optimization is the root of all evil.", "Donald Knuth" },
  { "Programs must be written for people to read, and only incidentally for machines to execute.", "Harold Abelson" },
  { "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.", "Martin Fowler" },
  { "Code is like humor. When you have to explain it, it's bad.", "Cory House" },
  { "Fix the cause, not the symptom.", "Steve Maguire" },
  { "Make it work, make it right, make it fast.", "Kent Beck" },
  { "The best way to predict the future is to invent it.", "Alan Kay" },
  { "I choose a lazy person to do a hard job. Because a lazy person will find an easy way to do it.", "Bill Gates" },
  { "Debugging is twice as hard as writing the code in the first place.", "Brian Kernighan" },
  { "The most disastrous thing that you can ever learn is your first programming language.", "Alan Kay" },
  { "Knowledge is power.", "Francis Bacon" },
  { "Citizens have a right and a duty to scrutinise the state.", "Julian Assange"},
  {"Controlling complexity is the essence of computer programming.","Brian Kernighan"},
  {"The most effective debugging tool is still careful thought, coupled with judiciously placed print statements.","Brian Kernighan"},
  {"Do what you think is interesting, do something that you think is fun and worthwhile, because otherwise you won't do it well anyway. ","Brian Kernighan"},
  {"Eventually, I decided that thinking was not getting me very far and it was time to try building.","Rob Pike"},
  {"I actually hate programming, but I love solving problems. ","Rasmus Lerdorf"},
  {"Ugly problems often require ugly solutions. Solving an ugly problem in a pure manner is bloody hard. ","Rasmus Lerdorf"},
  {"If you need more than 3 levels of indentation, you're screwed anyway, and should fix your program. ","Linus Torvalds"},
  {"You know you're brilliant, but maybe you'd like to understand what you did 2 weeks from now. ","Linus Torvalds"},
  {"If you still don't like it, that's OK: that's why I'm boss. I simply know better than you do. ","Linus Torvalds"},
  {"Regression testing'? What's that? If it compiles, it is good; if it boots up, it is perfect. ","Linus Torvalds"},
  {"I'm always right. This time I'm just even more right than usual. ","Linus Torvalds"},
  {"I am a lazy person, which is why I like open source, for other people to do work for me. ","Linus Torvalds"},
  {"People are strange, and you can't fix people. ","Linus Torvalds"},
  {"A good idea is something that does not solve just one single problem, but rather can solve multiple problems at once. ","Shigeru Miyamoto"},
  {"Testing shows the presence, not the absence of bugs ","Edsger W. Dijkstra"},
  {"Any fool can write code that a computer can understand. Good programmers write code that humans can understand. ","Kent Beck"},
  {"I think managers have realized that most software people are slightly brain damaged, that they're off on their own planets. ","Eugene Jarvis"},
  {"People said I should accept the world. Bullshit! I don't accept the world. ","Richard Stallman"},
  {"I always expect to lose. I fight anyway, and sometimes I win.","Richard Stallman"},
  {"you can leave politics alone, but politics won't leave you alone.","Richard Stallman"},
  {"Value your freedom or you will lose it, teaches history.","Richard Stallman"},
  {"It's stupidity. It's worse than stupidity: it's a marketing hype campaign.","Richard Stallman"},
  {"When in doubt, use brute force.","Ken Thompson"},
  {"I don't know if it's what you want, but it's what you get. ","Larry Wall"},
}

function M.get_random_quote()
  math.randomseed(os.time())
  return M.quotes[math.random(#M.quotes)]
end

return M
