<<< "Assignment_3_pe$$to" >>>;

//sound chain
Gain master => dac;

SndBuf kick1 => master;
SndBuf kick2 => master;
SndBuf hihat => master;
SndBuf hihat2 => master;
SndBuf snare1 => master;
SndBuf snare2 => master;
SndBuf cowbell => master;
SndBuf2 fx => master;

//generate sound waves
TriOsc um => NRev r => Pan2 p => master;
SinOsc dois => Pan2 p2  => master;
SawOsc tres => NRev r2 => Pan2 pantres => master; 

//defineArrays
//intro
[55, 55, 59, 57, 52, 52, 52, 59] @=> int Aintro[];
[52, 52, 50, 50, 50, 50, 50, 50] @=> int Cintro[];

//loop1
[60, 62, 60, 59, 55, 55, 55, 52] @=> int Aum[];
[52, 52, 50, 50, 55, 50, 50, 50] @=> int C[];
[74, 74, 79, 83, 74, 84, 81, 83] @=> int agudo1[];

//loop2
[55, 60, 60, 59, 59, 57, 50, 50] @=> int Adois[];
[52, 52, 52, 50, 50, 50, 52, 52] @=> int B[];
[83, 86, 86, 83, 91, 81, 81, 83] @=> int agudo2[];

//ending
[59, 55, 55, 57, 52, 52, 52, 59] @=> int ending1a[];
[50, 50, 50, 50, 50, 50, 50, 50] @=> int ending1b [];
[83, 83, 83, 83, 91, 86, 86, 86] @=> int agudofim[];

//ending2
[59, 55, 55, 57, 52, 52, 52, 59] @=> int ending2a[];
[50, 50, 50, 50, 50, 50, 50, 50] @=> int ending2b[];
[79, 79, 79, 79, 79, 79, 79, 79] @=> int agudofim2[];


//ending3
[52, 52, 52, 52, 52, 52, 52, 52] @=> int ending3a[];
[50, 50, 50, 50, 50, 50, 50, 50] @=> int ending3b[];




//load soundfiles
me.dir() + "/audio/kick_01.wav" => kick1.read;
me.dir() + "/audio/kick_03.wav" => kick2.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/hihat_03.wav" => hihat2.read;
me.dir() + "/audio/snare_03.wav" => snare1.read;
me.dir() + "/audio/snare_01.wav" => snare2.read;
me.dir() + "/audio/cowbell_01.wav" => cowbell.read;
me.dir() + "/audio/stereo_fx_05.wav" => fx.read;

//set all playhead to end so no sound is made
kick1.samples() => kick1.pos;
kick2.samples() => kick2.pos;
hihat.samples() => hihat.pos;
hihat2.samples() => hihat2.pos;
snare1.samples() => snare1.pos;
snare2.samples() => snare2.pos;
cowbell.samples() => cowbell.pos;
fx.samples() => fx.pos;

//initialize counter 
0 => int counter;

//intro
for( 0 => int i; i < 24; i++ )  
{
    counter%8 => int beat; // definir 8 posi��es na sequence
    //kick
    if((beat == 0) || (beat == 3))
    {
        0 => kick1.pos;
        0 => kick2.pos;
        0.2 => kick1.gain;
        0.2 => kick2.gain;
    }    
    //hihat
    if((beat == 1) || (beat == 2) || (beat == 4) || (beat == 5) || (beat == 7) || (beat == 8))
    {
        0 => hihat.pos;
        0.05 => hihat.gain;
    }
    //hihat2
    if((beat == 3) || (beat == 6))
    {
        0 => hihat2.pos;
        0.05 => hihat2.gain;
    }
    
    if(beat < 8)
    {
        Std.mtof(Aintro[beat]) => um.freq;
        0.2 => um.gain;    
        Std.mtof(Cintro[beat]) => dois.freq;
        0 => dois.gain;
        0 => tres.gain; 
    }
    
    //fx
        if(beat < 8)
    {
        
        -1.0 => fx.rate;
        Math.random2f(0.1, 0.4) => fx.gain;
    }
  
    <<< "counter:", counter, "beat:", beat >>>;
    counter ++;
    250::ms => now;
}
//intro2
for( 0 => int i; i < 8; i++ )  
{
    counter%8 => int beat; // definir 8 posi��es na sequence
    //kick
    if((beat == 0) || (beat == 1 ))
    {
        0 => kick1.pos;
        0 => kick2.pos;
        0.2 => kick1.gain;
        0.2 => kick2.gain;
    }    
    //snare
    if((beat == 5) || (beat == 6) || (beat == 7))
    {
        0 => snare1.pos;
        0 => snare2.pos;
        0.3 => snare1.gain;
        0.6 => snare2.gain;
    }
    //hihat
    if((beat == 0) || (beat == 1) || (beat == 2) || (beat == 4) || (beat == 5) || (beat == 7) || (beat == 8))
    {
        0 => hihat.pos;
        0.05 => hihat.gain;
    }
    //hihat2
    if((beat == 3) || (beat == 6))
    {
        0 => hihat2.pos;
        0.05 => hihat2.gain;
    }
    
    if(beat < 8)
    {
        Std.mtof(Aintro[beat]) => um.freq;
        0.2 => um.gain;    
        Std.mtof(Cintro[beat]) => dois.freq;
        0 => dois.gain;
        0 => tres.gain;
    }
  
    <<< "counter:", counter, "beat:", beat >>>;
    counter ++;
    250::ms => now;
}

//infinite loop 1
for( 0 => int i; i < 32; i++ )  
{
    counter%8 => int beat; // definir 8 posi��es na sequence
    //kick
    if((beat == 0) || (beat == 3) || (beat == 4))
    {
        0 => kick1.pos;
        0 => kick2.pos;
        0.2 => kick1.gain;
        0.2 => kick2.gain;
    }
    //snare
    if((beat == 2) || (beat == 6) || (beat == 7))
    {
        0 => snare1.pos;
        0 => snare2.pos;
        0.2 => snare1.gain;
        0.6 => snare2.gain;
    }    
    //hihat
    if(beat < 8)
    {
        0 => hihat.pos;
        0.05 => hihat.gain;
    }
    //cowbell
    if((beat == 3) || (beat == 6))
    {
        0 => cowbell.pos;
        0.2 => cowbell.gain;
        0.8 => cowbell.rate;
    }
    if(beat < 8)
    {
        Std.mtof(Aum[beat]) => um.freq;
        0.2 => um.gain;        
        Std.mtof(C[beat]) => dois.freq;
        0.3 => dois.gain;
        Std.mtof(agudo1[beat]) => tres.freq;
        0.01 => tres.gain;
    }    

    <<< "counter:", counter, "beat:", beat >>>;
    counter ++;
    250::ms => now;
}

//infinite loop 2
for( 0 => int i; i < 32; i++ )  
{
    counter%8 => int beat; // definir 8 posi��es na sequence
    //kick
    if((beat == 0) || (beat == 1) || (beat == 3) || (beat == 6))
    {
        0 => kick1.pos;
        0 => kick2.pos;
        0.2 => kick1.gain;
        0.2 => kick2.gain;
    }
    //snare
    if((beat == 2) || (beat == 3) || (beat == 6))
    {
        0 => snare1.pos;
        0 => snare2.pos;
        0.2 => snare1.gain;
        0.6 => snare2.gain;
    }    
    //hihat
    if((beat == 0) || (beat == 1) || (beat == 2) || (beat == 4) || (beat == 5) || (beat == 7))
    {
        0 => hihat.pos;
        0.05 => hihat.gain;
    }
    //hihat2
    if((beat == 3) || (beat == 6))
    {
        0 => hihat2.pos;
        0.05 => hihat2.gain;
    }
    
    if(beat < 8)
    {
        Std.mtof(Adois[beat]) => um.freq;
        0.2 => um.gain;    
        Std.mtof(B[beat]) => dois.freq;
        0.3 => dois.gain;
        Std.mtof(agudo2[beat]) => tres.freq;
        0.01 => tres.gain;
    }
    //cowbell
    if((beat == 1) || (beat == 7))
    {
        0 => cowbell.pos;
        0.2 => cowbell.gain;
        0.8 => cowbell.rate;
    } 

    <<< "counter:", counter, "beat:", beat >>>;
    counter ++;
    250::ms => now;
}

//endingintro
for( 0 => int i; i < 8; i++ )  
{
    counter%8 => int beat; // definir 8 posi��es na sequence
    
    //kick
    if((beat == 0) || (beat == 7))
    {
        0 => kick1.pos;
        0 => kick2.pos;
        0.2 => kick1.gain;
        0.2 => kick2.gain;
    }    
    
    //snare
    if((beat == 5))
    {
        0 => snare1.pos;
        0 => snare2.pos;
        0.3 => snare1.gain;
        0.6 => snare2.gain;
    }
    
    //hihat
    if((beat == 0) || (beat == 1) || (beat == 3) || (beat == 4) || (beat ==  6) || (beat == 7))
    {
        0 => hihat.pos;
        0.05 => hihat.gain;
    }
    
    //hihat2
    if((beat == 6))
    {
        0 => hihat2.pos;
        0.05 => hihat2.gain;
    }
    
    if(beat < 8)
    {
        Std.mtof(ending1a[beat]) => um.freq;
        0.2 => um.gain;    
        Std.mtof(ending1b[beat]) => dois.freq;
        0 => dois.gain;
        Std.mtof(agudofim[beat]) => tres.freq;
        0.005 => tres.gain;
    }
    
    //fx
        if(beat < 8)
    {
        
        -1.0 => fx.rate;
        Math.random2f(0.3, 0.5) => fx.gain;
    }
  
    <<< "counter:", counter, "beat:", beat >>>;
    counter ++;
    250::ms => now;
}

//ending
for( 0 => int i; i < 16; i++ )  
{
    counter%8 => int beat; // definir 8 posi��es na sequence
    
    //kick
    if((beat == 0) || (beat == 7))
    {
        0 => kick1.pos;
        0 => kick2.pos;
        0.2 => kick1.gain;
        0.2 => kick2.gain;
    }    
    
        //snare
    if((beat == 5))
    {
        0 => snare1.pos;
        0 => snare2.pos;
        0.3 => snare1.gain;
        0.6 => snare2.gain;
    }

    //hihat2
    if((beat == 6))
    {
        0 => hihat2.pos;
        0.05 => hihat2.gain;
    }
    
    if(beat < 8)
    {
        Std.mtof(ending1a[beat]) => um.freq;
        0.2 => um.gain;    
        Std.mtof(ending1b[beat]) => dois.freq;
        0 => dois.gain;
        Std.mtof(agudofim[beat]) => tres.freq;
        0.008 => tres.gain;
    }
    
    //fx
        if(beat < 8)
    {
        
        -1.0 => fx.rate;
        Math.random2f(0.3, 0.5) => fx.gain;
    }
  
    <<< "counter:", counter, "beat:", beat >>>;
    counter ++;
    250::ms => now;
}

//ending 2
for( 0 => int i; i < 8; i++ )  
{
    counter%8 => int beat; // definir 8 posi��es na sequence
    
    //kick
    if((beat == 0) || (beat == 3))
    {
        0 => kick1.pos;
        0 => kick2.pos;
        0.2 => kick1.gain;
        0.2 => kick2.gain;
    }    
    //hihat
    if((beat == 1) || (beat == 2) || (beat == 4) || (beat == 5) || (beat == 7) || (beat == 8))
    {
        0 => hihat.pos;
        0.05 => hihat.gain;
    }
    //hihat2
    if((beat == 3) || (beat == 6))
    {
        0 => hihat2.pos;
        0.05 => hihat2.gain;
    }
    
    if(beat < 8)
    {
        Std.mtof(ending2a[beat]) => um.freq;
        0.2 => um.gain;    
        Std.mtof(ending2b[beat]) => dois.freq;
        0 => dois.gain;
        Std.mtof(agudofim2[beat]) => tres.freq;
        0.01 => tres.gain;
    }
    
    //fx
        if(beat < 8)
    {
        
        -1.0 => fx.rate;
        Math.random2f(0.3, 0.5) => fx.gain;
    }
  
    <<< "counter:", counter, "beat:", beat >>>;
    counter ++;
    250::ms => now;
}

//ending 3
for( 0 => int i; i < 16; i++ )  
{
    counter%8 => int beat; // definir 8 posi��es na sequence
    
    SndBuf hihatpan => Pan2 pn => dac;
    me.dir() + "/audio/hihat_01.wav" => hihatpan.read;
    
    //hihat left
    if((beat % 2) == 0)
    {
        0 => hihatpan.pos;
        0.05 => hihatpan.gain;
        -1 => pn.pan;
    }

    //hihat right
    if((beat % 2) == 1)
    {
        0 => hihatpan.pos;
        0.05 => hihatpan.gain;
        1 => p.pan;
    }
    
    //hihat2
    if((beat == 3) || (beat == 6))
    {
        0 => hihat2.pos;
        0.05 => hihat2.gain;
    }
    
    if(beat < 8)
    {
        Std.mtof(ending3a[beat]) => um.freq;
        0.2 => um.gain;    
        Std.mtof(ending3b[beat]) => dois.freq;
        0 => dois.gain;
        0 => tres.gain;
    }
    
    //fx
        if(beat < 8)
    {
        
        -1.0 => fx.rate;
        Math.random2f(0.3, 0.5) => fx.gain;
    }
  
    <<< "counter:", counter, "beat:", beat >>>;
    counter ++;
    250::ms => now;
}

//finale
for( 0 => int i; i < 16; i++ )  
{
    counter%8 => int beat; // definir 8 posi��es na sequence
    
    SndBuf hihatpan => Pan2 pn => dac;
    me.dir() + "/audio/hihat_01.wav" => hihatpan.read;
 
    0 => um.gain;
    0 => tres.gain;
    
    //hihat left
    if(beat < 8)
    {
        0 => hihatpan.pos;
        0.05 => hihatpan.gain;
        Math.random2(-1, 1) => pn.pan;
        Math.random2f(-1.0, 1.0) => hihatpan.rate;
    }
    
    //fx
    if(beat < 8)
    {   
        -1.0 => fx.rate;
        Math.random2f(0.3, 0.5) => fx.gain;
    }
    <<< "counter:", counter, "beat:", beat >>>;
    counter ++;
    250::ms => now;
}
