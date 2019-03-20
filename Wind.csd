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
    kAmp chnget "amp"
    printk2 kAmp
    a1 butterbp aNoise, 100+randi:k(100*kAmp, .5), 100
    a2 butterbp aNoise, 200+randi:k(100*kAmp, .32), 300
    a3 butterbp aNoise, 300+randi:k(100*kAmp, .15), 500
    outs (a1+a2+a3)*kAmp, (a1+a2+a3)*kAmp
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
i1 0 36000
</CsScore>
</CsoundSynthesizer>