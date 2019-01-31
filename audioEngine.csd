<CsoundSynthesizer>
<CsInstruments>
ksmps = 64
0dbfs = 1

instr PLAY_ONCE
    SFilename strcpy p4
    iLength = filelen(SFilename)
    p3 = iLength
    a1 diskin2 SFilename, 1, 0, 0
    outs a1, a1
endin
</CsInstruments>
<CsScore>
f0 z
</CsScore>
</CsoundSynthesizer>

