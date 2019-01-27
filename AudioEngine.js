function AudioEngine (filename) {

    this.audioDirectory = "";

    this.setAudioDirectory = function(dir){
        this.audioDirectory = dir;
    }

    this.start = function()
    {
        csound.PlayCsd(filename);
    }
    
    this.playOnceWithDelay = function(filename, distance, temperature)
    {
        //code goes here...
    }

        
    this.addFiles = function(files)
    {
        for( var i = 0; i < files.length; i++ ){
            console.log("Adding file: "+files[i]);
            csound.CopyUrlToLocal(this.audioDirectory+'/'+files[i], files[i], function(){});
        }
    }  

    this.playOnce = function(filename)
    {
        csound.ReadScore('i"PLAY_ONCE" 0 1 "'+filename+'"');   
    }

    this.isLoaded = true;
}

 