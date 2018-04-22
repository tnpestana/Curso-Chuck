<<< "Assignment_4_pesto" >>>;

// sound chain osc
Gain master => dac;
TriOsc chord[3];
for( 0 => int i; i < chord.cap(); i++ )
{
    // use array to chuck unit generator to master
    chord[i] => NRev r => master;
    0.1 => chord[i].gain;
}
// sound chain beat
SndBuf click => master;
SndBuf kick => master;
SndBuf snare => master;
SndBuf kick2 => master;
SndBuf hihat => master;
// open soundfiles
me.dir() + "../audio/kick_01.wav" => kick.read;
me.dir() + "../audio/kick_03.wav" => kick2.read;
me.dir() + "../audio/snare_03.wav" => click.read;
me.dir() + "../audio/snare_02.wav" => snare.read;
me.dir() + "../audio/hihat_01.wav" => hihat.read;
// set playheads to no sound
kick.samples() => kick.pos;
kick2.samples() => kick2.pos;
click.samples() => click.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;
// global variable
// melody
[1,1,2,2,2,3,3,3] @=> int osc_ptrn_1[];
[2,2,2,2,2,3,3,3] @=> int osc_ptrn_2[];
[4,4,4,4,1,2,3,3] @=> int osc_ptrn_3[];
[2,2,2,2,2,1,1,1] @=> int osc_ptrn_4[];
// kick
[1,1,0,1,1,0,0,0] @=> int kick_ptrn_1[];
[1,1,0,1,1,0,0,0] @=> int kick2_ptrn_1[];
[1,0,1,0,1,0,0,0] @=> int kick_ptrn_2[];
[1,0,1,0,1,0,0,0] @=> int kick2_ptrn_2[];
// snare
[0,0,1,0,0,0,1,0] @=> int click_ptrn_1[];
[0,0,1,0,0,0,1,0] @=> int snare_ptrn_1[];
[0,0,1,0,1,1,1,0] @=> int click_ptrn_2[];
[0,0,1,0,1,1,1,0] @=> int snare_ptrn_2[];
// hihat
[1,1,1,1,1,1,1,1] @=> int hihat_ptrn_1[];
// functions
// melody
fun void playChord( int root )
{
    // function will make major or minor chords
    
    //root
    Std.mtof(root) => chord[0].freq;
    
    //third
    Std.mtof(root+3) => chord[1].freq;
    //octave
    Std.mtof(root+12) => chord[2].freq;
}
// beat
fun void section( int kickArray[], int kick2Array[], int clickArray[], int snareArray[], int hihatArray[], int oscArray[], float beattime )
{
    // sequencer for bass drum and snare beats
    for( 0 => int i; i < kickArray.cap(); i++ )
    {
        // if 1 in the array then play kick
        if( kickArray[i] == 1 )
        {
            0 => kick.pos;
            0.2 => kick.gain;
        }   
        
        if( kick2Array[i] == 1 )
        {
            0 => kick.pos;
            0.2 => kick2.gain;
        }   
        
        if( clickArray[i] == 1 )
        {
            0 => click.pos;
            0.2 => click.gain;
        }
        
        if( snareArray[i] == 1 )
        {
            0 => snare.pos;
            0.2 => snare.gain;
        }
        
        if( hihatArray[i] == 1 )
        {
            0 => hihat.pos;
            0.03 => hihat.gain;
        }
                if( oscArray[i] == 0 )
        {
            0 => chord[i].gain;
        }   
        
        if( oscArray[i] == 1 )
        {
            playChord(55);
        }   
        
        if( oscArray[i] == 2 )
        {
            playChord(53);
        }
        
        if( oscArray[i] == 3 )
        {
            playChord(49);
        }
        
        if( oscArray[i] == 4 )
        {
            playChord(58);
        }
        
        beattime::second => now;
        
    }
}
// MAIN PROGRAM
// 1
for( 0 => int i; i < 3; i++ )  
{
    section(kick_ptrn_1, kick2_ptrn_1, click_ptrn_1, snare_ptrn_1, hihat_ptrn_1, osc_ptrn_1, .2);
}
for( 0 => int i; i < 1; i++ )  
{
    section(kick_ptrn_2, kick2_ptrn_2, click_ptrn_2, snare_ptrn_2, hihat_ptrn_1, osc_ptrn_2, .2);
}
for( 0 => int i; i < 3; i++ )  
{
    section(kick_ptrn_1, kick2_ptrn_1, click_ptrn_1, snare_ptrn_1, hihat_ptrn_1, osc_ptrn_1, .2);
}
for( 0 => int i; i < 1; i++ )  
{
    section(kick_ptrn_2, kick2_ptrn_2, click_ptrn_1, snare_ptrn_1, hihat_ptrn_1, osc_ptrn_2, .2);
}
// 2
for( 0 => int i; i < 2; i++ )  
{
    section(kick_ptrn_1, kick2_ptrn_1, click_ptrn_1, snare_ptrn_1, hihat_ptrn_1, osc_ptrn_3, .2);
}
for( 0 => int i; i < 2; i++ )  
{
    section(kick_ptrn_2, kick2_ptrn_1, click_ptrn_1, snare_ptrn_2, hihat_ptrn_1, osc_ptrn_2, .2);
}
for( 0 => int i; i < 2; i++ )  
{
    section(kick_ptrn_1, kick2_ptrn_1, click_ptrn_1, snare_ptrn_1, hihat_ptrn_1, osc_ptrn_3, .2);
}
for( 0 => int i; i < 2; i++ )  
{
    section(kick_ptrn_2, kick2_ptrn_1, click_ptrn_1, snare_ptrn_1, hihat_ptrn_1, osc_ptrn_2, .2);
}
for( 0 => int i; i < 4; i++ )  
{
    i/10 => chord[i].gain;
    section(kick_ptrn_1, kick2_ptrn_1, click_ptrn_1, snare_ptrn_1, hihat_ptrn_1, osc_ptrn_1, .2);
}
