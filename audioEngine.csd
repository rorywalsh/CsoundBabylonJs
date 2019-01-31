<CsoundSynthesizer>
<CsInstruments>
ksmps = 64
0dbfs = 1

instr PLAY_ONCE
    SFilename strcpy p4
    iLength = filelen(SFilename)
    iChannels = filenchnls(SFilename)
    p3 = iLength
    if iChannels == 2 then
            a1, a2 diskin2 SFilename, 1, 0, 0
            outs a1, a2
    else
            a1 diskin2 SFilename, 1, 0, 0
            outs a1, a1
    endif
endin


instr START_AUDIOSOURCE
    ; creates a unique channel with same 
    ; name as game object
    kDistance init 100;
    SChannel strcpy p5
    kDistance chnget SChannel
    
    kDistance tonek kDistance, 10
    
    SFilename strcpy p4
    iLength = filelen(SFilename)
    iChannels = filenchnls(SFilename)

    ; only permit playback if there is a 
    ; chance the sound will be heard
    if abs(kDistance) < 60 then
        aScale = ampdb(-kDistance)
        if iChannels == 2 then
                a1, a2 diskin2 SFilename, 1, 0, 1
                outs a1*aScale, a2*aScale
        else
                a1 diskin2 SFilename, 1, 0, 1
                outs a1*aScale, a1*aScale
        endif
    endif
endin

</CsInstruments>
<CsScore>
f0 z
</CsScore>
</CsoundSynthesizer>

