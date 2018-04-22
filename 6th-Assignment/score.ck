// score.ck
// <<<Assignment_6_pe$$to>>>

// Add your composition files when you want them to come in

Machine.add(me.dir() + "drums.ck") => int drumID;

3.2::second => now;

Machine.add(me.dir() + "piano.ck") => int pianoID;

6.4::second => now;

Machine.add(me.dir() + "flute.ck") => int fluteID;
Machine.add(me.dir() + "bass.ck") => int bassID;

25::second => now;

Machine.remove(drumID);
Machine.remove(bassID);
Machine.remove(fluteID);
Machine.remove(pianoID);