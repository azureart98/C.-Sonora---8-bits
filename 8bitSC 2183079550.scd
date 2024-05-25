s.boot;

// tono principal
(
SynthDef(\sinte1, {
    |freq = 440, amp = 0.1, dur = 1|
    var env = EnvGen.kr(Env.perc(0.01, dur), doneAction: 2);
    var sig = SinOsc.ar(freq) * amp * env;
    Out.ar(0, sig!2);
}).add;
)

// bajo
(
SynthDef(\sinte2, {
    |freq = 220, amp = 0.1, dur = 1|
    var env = EnvGen.kr(Env.perc(0.01, dur), doneAction: 2);
    var sig = Saw.ar(freq) * amp * env;
    Out.ar(0, sig!2);
}).add;
)

// percusión
(
SynthDef(\sinte3, {
    |amp = 0.1, dur = 0.1|
    var env = EnvGen.kr(Env.perc(0.001, dur), doneAction: 2);
    var noise = WhiteNoise.ar(amp) * env;
    Out.ar(0, noise!2);
}).add;
)


//pdef de la cancioncita
(
Pdef(\melodia8bit,
    Ppar([
        Pbind(
            \instrument, \sinte1,
            \dur, Pseq([0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.25, 0.25], inf),
            \freq, Pseq([660, 660, 660, 523, 660, 784, 392, 523, 392, 330, 440, 494, 466, 440, 392, 659], inf), // Melodía
            \amp, 0.1
        ),

        Pbind(
            \instrument, \sinte2,
            \dur, Pseq([0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], inf),
            \freq, Pseq([110, 110, 220, 220, 110, 110, 220, 220], inf), // Línea de bajo
            \amp, 0.1
        ),

        Pbind(
            \instrument, \sinte3,
            \dur, Pseq([0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25], inf),
            \amp, 0.1
        )
    ])
).play;
)
