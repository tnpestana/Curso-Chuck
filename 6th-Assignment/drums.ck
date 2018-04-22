// drums.ck
// <<<Assignment_6_pe$$to>>>


// Part of your composition goes here
//sound chain
<<< "Assignment_4_pe$$to" >>>;
// sound chain osc
Gain master => dac;

// sound chain beat
SndBuf click => master;
SndBuf kick => master;
SndBuf snare => master;
SndBuf kick2 => master;
SndBuf hihat => master;
// open soundfiles
me.dir(-1) + "/audio/kick_01.wav" => kick.read;
me.dir(-1) + "/audio/kick_03.wav" => kick2.read;
me.dir(-1) + "/audio/snare_03.wav" => click.read;
me.dir(-1) + "/audio/snare_02.wav" => snare.read;
me.dir(-1) + "/audio/hihat_01.wav" => hihat.read;
// set playheads to no sound
kick.samples() => kick.pos;
kick2.samples() => kick2.pos;
click.samples() => click.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;
// global variable
// kick
[1,0,0,1,0,0,0,0] @=> int kick_ptrn_1[];
[1,0,0,1,0,0,0,0] @=> int kick2_ptrn_1[];
[1,0,1,0,1,0,0,0] @=> int kick_ptrn_2[];
[1,0,1,0,1,0,0,0] @=> int kick2_ptrn_2[];
[0,0,0,0,0,0,0,0] @=> int kick_ptrn_3[];
[0,0,0,0,0,0,0,0] @=> int kick2_ptrn_3[];
// snare
[0,0,1,0,0,0,1,0] @=> int click_ptrn_1[];
[0,0,1,0,0,0,1,0] @=> int snare_ptrn_1[];
[0,0,1,0,1,1,1,0] @=> int click_ptrn_2[];
[0,0,1,0,1,1,1,0] @=> int snare_ptrn_2[];
[0,0,0,0,0,0,0,0] @=> int click_ptrn_3[];
[0,0,0,0,0,0,1,0] @=> int snare_ptrn_3[];
// hihat
[1,1,1,1,1,1,1,1] @=> int hihat_ptrn_1[];
// functions
// beat
fun void section( int kickArray[], int kick2Array[], int clickArray[], int snareArray[], int hihatArray[], float beattime )
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

        beattime::second => now;
        
    }
}
// MAIN PROGRAM
// 1
for( 0 => int i; i < 4; i++ )
{
    for( 0 => int i; i < 3; i++ )  
    {
        section(kick_ptrn_1, kick2_ptrn_1, click_ptrn_1, snare_ptrn_1, hihat_ptrn_1, .2);
    }

    for( 0 => int i; i < 1; i++ )  
    {
        section(kick_ptrn_2, kick2_ptrn_2, click_ptrn_2, snare_ptrn_1, hihat_ptrn_1, .2);
    }
}

for( 0 => int i; i < 4; i++ )
{
    for( 0 => int i; i < 1; i++ )  
    {
        section(kick_ptrn_3, kick2_ptrn_3, click_ptrn_3, snare_ptrn_3, hihat_ptrn_1, .2);
    }

}