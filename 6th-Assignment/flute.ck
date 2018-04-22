// flute.ck
// <<<Assignment_6_pe$$to>>>

// sound chain
Clarinet c => JCRev rev => dac;
c => Delay d => d => rev;

0.5 => rev.mix;
0.8::second => d.max => d.delay;
0.5 => d.gain;

// scale
[46,48,49,51,53,56,58] @=> int scale[];

// Part of your composition goes here
.5 => c.noteOn;
0.06 => c.gain;

for( 0 => int i; i < 3; i++)
{
    .5 => c.noteOn;
    Std.mtof(73) => c.freq;
    2.4::second => now;
    for( 0 => int i; i < 2; i++)
    {
        Std.mtof(80) => c.freq;
        0.4::second => now;
        Std.mtof(77) => c.freq;
        0.4::second => now;
        Std.mtof(84) => c.freq;
        .4::second => now; 
    }
    
}
for( 0 => int i; i < 1; i++)
{
    .5 => c.noteOn;
    Std.mtof(70) => c.freq;
    2.4::second => now;

    Std.mtof(75) => c.freq;
    0.4::second => now;
    Std.mtof(68) => c.freq;
    0.4::second => now;
    Std.mtof(73) => c.freq;
    3::second => now;
    
}