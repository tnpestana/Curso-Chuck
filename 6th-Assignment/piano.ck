// piano.ck
// <<<Assignment_6_pe$$to>>>
Rhodey piano[4];
piano[0] => dac.left;
piano[1] => NRev r => dac;
piano[2] => NRev r2 => dac;
piano[3] => dac.right;

0.5 => r.mix;
0.5 => r2.mix;


// chord
[[46,49,53,56],[48,51,54,58],[49,51,53,58],[46,48,56,58]] @=> int chordz[][];

// Part of your composition goes here
for(  0 => int i; i < 4; i++ )
{
    // 1st chord
    for( 0 => int i; i < 4; i++)
    {
        Std.mtof(chordz[2][i]) => piano[i].freq;
        Math.random2f(0.1,0.3) => piano[i].noteOn;
    }
    .8::second => now;
    
    // 2nd chord
    for( 0 => int i; i < 4; i++)
    {
        Std.mtof(chordz[1][i]) => piano[i].freq;
        Math.random2f(0.1,0.3) => piano[i].noteOn;
    }
    
    .8::second => now;
    
    //3rd chord
    for( 0 => int i; i < 4; i++)
    {
        Std.mtof(chordz[0][i]) => piano[i].freq;
        Math.random2f(0.1,0.3) => piano[i].noteOn;
    }
    0.6::second => now;
    
    //4th chord
    for( 0 => int i; i < 4; i++)
    {
        Std.mtof(chordz[3][i]) => piano[i].freq;
        Math.random2f(0.1,0.3) => piano[i].noteOn;
    }
    .6::second => now;
    
    // 2nd chord
    for( 0 => int i; i < 4; i++)
    {
        Std.mtof(chordz[1][i]) => piano[i].freq;
        Math.random2f(0.1,0.3) => piano[i].noteOn;
    }
    0.4::second => now;
    
    // 1st chord
    for( 0 => int i; i < 4; i++)
    {
        Std.mtof(chordz[0][i]) => piano[i].freq;
        Math.random2f(0.1,0.3) => piano[i].noteOn;
    }
    0.6::second => now;
    
    //4th chord
    for( 0 => int i; i < 4; i++)
    {
        Std.mtof(chordz[3][i]) => piano[i].freq;
        Math.random2f(0.1,0.3) => piano[i].noteOn;
    }
    .6::second => now;
    
    // 2nd chord
    for( 0 => int i; i < 4; i++)
    {
        Std.mtof(chordz[1][i]) => piano[i].freq;
        Math.random2f(0.1,0.3) => piano[i].noteOn;
    }
    0.4::second => now;
    
    // 1st chord
    for( 0 => int i; i < 4; i++)
    {
        Std.mtof(chordz[0][i]) => piano[i].freq;
        Math.random2f(0.1,0.3) => piano[i].noteOn;
    }
    1.6::second => now;
}