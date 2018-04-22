// bass.ck
// <<<Assignment_6_pe$$to>>>

// sound chain
Mandolin bass => NRev r => dac;

0.2 => r.mix;
0.0 => bass.stringDamping;
0.02 => bass.stringDetune;
0.05 => bass.bodySize;
0.65 => bass.gain;


// Part of your composition goes here

for(  0 => int i; i < 6; i++ )
{
    Math.random2f(0.5, 1) => bass.noteOn;
    Std.mtof(37) => bass.freq;
    1.6::second => now;
    Math.random2f(0.5, 1) => bass.noteOn;
    Std.mtof(39) => bass.freq;
    1.6::second => now;
}

for(  0 => int i; i < 1; i++ )
{
    Math.random2f(0.5, 1) => bass.noteOn;
    Std.mtof(37) => bass.freq;
    2::second => now;
}