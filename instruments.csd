<CsoundSynthesizer>
<CsOptions>
-n -d 
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
    aNoise pinker
    a1 butterbp aNoise, 100+randi:k(100, .5), 100
    a2 butterbp aNoise, 200+randi:k(100, .32), 300
    a3 butterbp aNoise, 300+randi:k(100, .15), 500

    a1L, a1R pan2 a1*randi:k(.8, .1), random(0, 1)
    a2L, a2R pan2 a2*randi:k(.6, .35), random(0, 1)
    a3L, a3R pan2 a3*randi:k(.4, .576), random(0, 1)
    outs a1L+a2L+a3L, a1R+a2R+a3R
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
i1 0 36000
</CsScore>
</CsoundSynthesizer>
