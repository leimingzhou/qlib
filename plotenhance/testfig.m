x=linspace(0,20,50);
y=sin(x);
figure;
fig=plot(x,y);
pathname='PhasediagramLG03-2um';
labelx='Radius(\mum)';labely='\gamma(pN \mus/\mum)';labelfont=56;axisfont=48;
figset(labelx,labely,labelfont,axisfont,pathname,y)