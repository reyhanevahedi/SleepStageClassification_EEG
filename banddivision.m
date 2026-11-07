function out = banddivision(FT, Band)
   load('matlab.mat')
    stage2.Data(stage2.Duration,:) = stage2.Data(stage2.Duration,:);
    stage2.Duration = stage2.Duration;
    Fs = stage2.Fs(1);
    Ts = 1/Fs;
    Ns = stage2.Duration;
    df = 1/(Ns * Ts);
    f = (-Ns/2:Ns/2-1)*df;
    epoch = (0:Ns)*Ts;
    
    FTnew = FT;
    
    if strcmp(Band,'DELTA')
        [~,deltaminp]=min(abs(f-0.5));
        [~,deltaminn]=min(abs(f+0.5));
        [~,deltamaxp]=min(abs(f-4));
        [~,deltamaxn]=min(abs(f+4));
        FTnew(deltaminn:deltaminp)=0;
        FTnew(deltamaxp:end)=0;
        FTnew(1:deltamaxn)=0;
        out = FTnew;  
    
    elseif strcmp(Band,'THETA')
        [~,thetaminp]=min(abs(f-4));
        [~,thetminn]=min(abs(f+4));
        [~,thetmaxp]=min(abs(f-8));
        [~,thetmaxn]=min(abs(f+8));
        FTnew(thetminn:thetaminp)=0;
        FTnew(thetmaxp:end)=0;
        FTnew(1:thetmaxn)=0;
        out = FTnew;
    
    elseif strcmp(Band,'ALPHA')
        [~,alphaminp]=min(abs(f-8));
        [~,alphaminn]=min(abs(f+8));
        [~,alphamaxp]=min(abs(f-13));
        [~,alphamaxn]=min(abs(f+13));
        FTnew(alphaminn:alphaminp)=0;
        FTnew(alphamaxp:end)=0;
        FTnew(1:alphamaxn)=0;
        out = FTnew;
    
    elseif strcmp(Band,'BETA')
        [~,betaminp]=min(abs(f-13));
        [~,betaminn]=min(abs(f+13));
        [~,betamaxp]=min(abs(f-30));
        [~,betamaxn]=min(abs(f+30));
        FTnew(betaminn:betaminp)=0;
        FTnew(betamaxp:end)=0;
        FTnew(1:betamaxn)=0;
        out = FTnew;
    
    elseif strcmp(Band,'GAMMA')
        [~,gamaminp]=min(abs(f-30));
        [~,gamaminn]=min(abs(f+30));
        [~,gamamaxp]=min(abs(f-80));
        [~,gamamaxn]=min(abs(f+80));
        FTnew(gamaminn:gamaminp)=0;
        FTnew(gamamaxp:end)=0;
        FTnew(1:gamamaxn)=0;
        out = FTnew;
    end
    
end