/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 
 
 Variable Checking!
 
 Equality: "Spot"  == "Spot"
 Not equality: 1 != 2
 Greater: >
 Less: <
 Greater ot equal: >=
 Less or equal: <=
 
 
 
*/

VAR health = 3
VAR name = ""
VAR sword = 0
VAR seen_mother = 0
VAR jill = 0
VAR strength = 0
VAR rod_health = 3
VAR loss = 0
VAR victory = 0

-> memory

== memory ==
(This whole thing is just the intro of final fantsasy xvi) You live in the grand Duchy of Rosaria, you are the son of Duke Elwin Rosfield, what is your name?
(Clive is encouraged for more content as well as combat)

 * [Clive Rosfield, the older brother, Joshua's shield and protector]
    ~ name = "Clive"
    -> rosalith
 * [Joshua Rosfield, the younger sick brother, Dominant of the Phoenix]
    ~ name = "Joshua"
    ->rosalith
    
== rosalith ==
Before you stands your father, {name} my son, tomorrow will be the rite at Phoenix Gate.
{ name == "Clive": You know your brother Joshua needs all the help he can get performing the rite of Phoenix Gate, he is still quite young and sick. "Of course father, I will get ready at once." You reply.|}
{ name == "Joshua": You must rest up before then, my son, your brother Clive will be there to protect you the whole way. "Thank you father, I trust in my big brother more than anyone! I will be off now."|}

 + [Head to your chambers] -> rosfield_room
 + [Head to see mother] -> annabella_room
 + {name == "Clive"} [Talk more with your father] -> rosalith_2
 
 == rosalith_2 ==
 {"Will you be accompanying us father?" You ask. "Of course Clive, I must be present for Joshua's rite.| "Your mother has been doting much on Joshua lately." "I see..." "I have no clue why she is so hard on you, my son."|"The rite at Phoenix Gate will be a breeze. Joshua simply needs our assistance."|"Well, Clive, I must get ready myself, I suggest you do as well. Take care of anything you need to do."}
 
 + [Head to your chambers] -> rosfield_room
 + [Head to see mother] -> annabella_room
 + [Talk more with your father] -> rosalith_2
 == rosfield_room ==
 ~ jill = jill + 1
You make your way to your room. On the way there you see Jill Warrick, the young girl around your age that your parents adopted from up north, along with your dog Torgal, a small gray puppy.
{ name == "Clive": "Good morning {name} are you prepared to support Joshua tomorrow? I wish I could come... "There should be no issues, but Joshua must remain safe, and I will make sure of that. I'll be back." You reply.|}
{ name == "Joshua": "Hi Joshua! Good luck tomorrow!" "Thank you Jill, and you too Torgal." You reply and pet Torgal. You continue to your room.|}
 + [Get ready for tomorrow] -> preparation
 * {seen_mother < 1} [Head to see your mother] -> annabella_room

 == annabella_room ==
 ~ seen_mother = seen_mother + 1
You go find to your mother Annabella.
{ name == "Clive": Maybe Joshua will be there... You walk over to find your mother as well as your younger brother Joshua with your dog Torgal in his arms, he is a small gray puppy. Joshua is getting doted on by mother. Torgal is the first to see you, he jumps out of Joshua's arms and runs up to you, Joshua is surprised by this and turns to greet you, he runs up as well and hugs you. Your mother frowns as she tries to get Joshua to come with her, she gives you a glare.|}
{ name == "Joshua": As you approach your mother she springs up and rushes towards you. She worries about you and what may happen tomorrow, not without badmouthing Clive. You never understood why she didn't like him. Nevertheless you say your goodbyes.|}
+ {jill < 1} [Go to your room] ->rosfield_room
* {jill > 0} [Return to your room and prepare for tomorrow] -> preparation

== preparation ==
{not sword_pickup: You head back to your room to sleep for the night, tomorrow is a big day.} {sword_pickup: With your preparations finished you can finally go meet with your brother and father.} 
+ {sword > 0} [Go meet your brother out front] -> front_yard
* {sword > 0} { name == "Clive"} [Train for a bit with Captain Rodney Murdoch] -> training
* {sword < 1} [Grab your sword] -> sword_pickup

== sword_pickup ==
~ sword = sword +1
You grab the sword given to you by your father and put it in your sheath.
+ [Go back] ->preparation

== training ==
~ strength = strength +1
"Ah, hello there Clive, wanted to get in a bit of training before the rite?" "Yes please Captain Murdoch..." 
"Well I've taught you practically everything, how about a sparring match where we go all out?"
"That sounds wonderful. Thank you."
+ [Charge in] -> offense_1
+ [Stay on guard] -> defense_1

== offense_1 ==
~ health = health -1
You charge at Captain Murdoch. Because of his experience, he swiftly parries and hits you with the butt of his sword.
"Come now, Clive, remember your caution."

Your health is now {health}/3

+ [Charge in once more] -> offense_2
+ [Raise your guard] -> defense_1
-> END

== defense_1 ==
~ rod_health = rod_health -1
{health >0: Rodney begins an attack. You anticipate this and dodge. Counterattacking with your sword. "Very good, Clive, way to anticipate my attack!"}

Your health is {health}/3
Captain Murdoch's health is {rod_health}/3

+ [Counterattack] -> counterattack
+ [Stay on guard] -> defense_loss

== defense_loss ==
~ health = health -1
{Captain Murdoch rushes at you, you try dodging again but he anticipates the dodge and catches you with his sword. "You can't dodge forever, Clive. actually attack me!"|Rodney is able to crush your guard this time slashing you. "Now what did i just say, Clive?"}

Your health is {health}/3
Captain Murdoch's health is {rod_health}/3

+ [Counterattack] ->counterattack
+ {health > 1} [Stay on guard] -> defense_loss

== counterattack==
~ rod_health = 0
While Captain Murdoch's guard is down, you rush in, making use of the powers of the Phoenix given to you by Joshua, you hit him with a fiery wing onf the Phoenix, sending him up into the air. He crashes back onto the ground in pain.

Your health is {health}/3
Captain Murdoch's health is {rod_health}/3

You won the match!
+ [Help Rodney up] -> win

== offense_2 ==
~ health = health -1
~ rod_health = rod_health -1

You charge in one more, making use of the powers of the Phoenix given to you by Joshua. You fling fire balls at the Captain, he dodges but you still manage to hit him with one on the shoulder.
"Bloody hell, Clive, that hurt!"

Your health is {health}/3
Captain Murdoch's health is {rod_health}/3
+ [Counterattack] -> counterattack
+ [Defend yourself] -> defense_2

== defense_2 ==
Captain Murdoch rushes at you, his expression shifted to seriousness, you can barely comprehend how fast he is, he closes the gap almost immediately, slashes your sword away and has you on the ground.
~ health = 0


Your health is {health}/3
Captain Murdoch's health is {rod_health}/3

+ [You lost!] ->lose

== win ==
~ victory = victory +1
You help Captain Rodney up, he groans in pain yet smiles at you.
{health == 3: "Wow, Clive, now when did you go off and get so strong? I'd say you're more than ready to be Joshua's shield."}
{health == 2: "Ah well, about what I expected. Experience can only get me so far, you really do know your way around the sword, and those Phoenix powers really give you that edge. Good luck Clive!"  "Thank you Captain, that was a wonderful training session!"}
{health == 1: "Just when I thought I might win you decide to bring out those Phoenix powers. But don't rely on them too heavily... continue to hone your sword Clive, and nothing can stop you." "Thank you Rodney, I'll use what I've learned from you today to protect Joshua.}
+ [Go meet with Joshua and your Father] -> front_yard

== lose ==
~ loss = loss +1
"Ah, too bad Clive, you almost had me! I was surprised you didn't make use of your Phoenix powers, you probably could've won if you did, hahahaha!"
"I will use this experience to learn, thank you for this, Rodney."
+ [Go meet with Joshua and your Father] -> front_yard

== front_yard ==
You make your way out to the front yard.
{ name == "Clive": You see Joshua, your father, and Jill and Torgal are even there to send you off. What will happen at Phoenix Gate? You don't know, but one thing is for certain, you will protect Joshua.|}
{ loss == 1: Though you feel uncertain after your loss against Rodney, you are still confidant in your skills to protect Joshua. You make your way off to Phoenix Gate.}
{ victory == 1: Now that you've proven yourself to your teacher, you have no doubt that you will bring glory to Rosaria. As you are leaving for Phoenix gate. Your head starts to throb as you see a shadowy figure in the distance. It's voice rings in your ears in a language you've never heard before, but for some reason you can understand what it says. "Found you." You catch a glimpse of Joshua and it snaps you out of this trancelike state. You give him a wink as you set off towards Phoenix Gate.}
{ name == "Joshua": You first see Jill and Torgal, who walk with you. You have some trouble getting there as you start coughing and not feeling well. But seeing your big brother Clive revitalizes you. Him and your father are there supporting you. As the dominant of the Phoenix, you must perform the rite of Phoenix gate. You say goodbye to Jill and Torgal and head off. This is where your journey begins.|}
-> END
