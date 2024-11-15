<CsoundSynthesizer>
<CsInstruments>
ksmps = 64
0dbfs = 1

instr 1
    aDeclick linseg 0, 1, 0, 1, 1, 10, 1
    ; creates a unique channel with same 
    ; name as game object
    SChannel strcpy p5
    kDistance chnget SChannel
    kDistance tonek kDistance, 10
    
    ; create or modify sounds
    ; remembering to adjust for distance
    a1 oscili 1, 400
    
    if p4 == 0 then         ;logarithmic
        aScale = ampdb(-kDistance)
        aOut = a1*aScale
    else                    ;linear
        aOuts = a1*(1/kDistance)
    endif

    outs aOut*aDeclick, aOut*aDeclick
endin
</CsInstruments>
<CsScore>
f0 z
</CsScore>
</CsoundSynthesizer>

