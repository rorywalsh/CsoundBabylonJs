/* Sample audio engine for use with BabylonJS */

function AudioEngine (filename) {

    this.audioDirectory = "";

    this.setAudioDirectory = function(dir){
        this.audioDirectory = dir;
    }

    this.start = function(){
        csound.PlayCsd(filename);
    }
    
    this.playOnceWithDelay = function(filename, distance, temperature){
        //code goes here...
    }

        
    this.addFiles = function(files){
        for( var i = 0; i < files.length; i++ ){
            csound.CopyUrlToLocal(this.audioDirectory+'/'+files[i], files[i], function(){            console.log("Adding file: "+files[i]);});
        }
    }  

    this.playOnce = function(filename){
        csound.ReadScore('i"PLAY_ONCE" 0 1 "'+filename+'"');   
    }

    this.startAudioSource = function(source, listener, filename){
        csound.ReadScore('i"START_AUDIOSOURCE" 0 -1 "'+filename+'" '+'"'+source.name+'"');  
        this.setSourceAmplitude(source, listener);   
    }

    //function to send distances to audio engine
    this.setSourceAmplitude = function(source, listener, scale = 1){
        if(this.isLoaded == true){
            const distance = BABYLON.Vector3.Distance(listener.position, source.position)
            csound.SetChannel(source.name, distance*scale);
        }
    }

    this.filterSource(source, cutoff)
    {
        if(this.isLoaded == true){
            csound.SetChannel(source.name, cutoff);
        }
    }

    this.isLoaded = true;
}

 