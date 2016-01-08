function plotxy(x,y,labelx,labely,pathname,type)
%PLOTXY Plot a figure with single x and single y,
%for scientific paper in right size with all figure elements.
%
%   See also: savez1
switch type
    case 11
        labelfont=48;axisfont=36;
    case 12
        labelfont=56;axisfont=48;
    case 22
        labelfont=72;axisfont=56;
end

figure;
% set(gcf,'PaperSize',[21.0 14.8],'PaperPosition',[0.6, 0.2, 20, 14])%A5 paper
set(gcf,'PaperSize',[14.4 10.5],'PaperPosition',[0.4, 0.1, 14, 10])%A6 paper
plot(x,y,'-','LineWidth',4)
xlabel(labelx,'FontSize',labelfont)
ylabel(labely,'FontSize',labelfont);
grid on
set(gca,'FontName','Times New Roman','FontSize',axisfont)

saveas(gcf, [pathname, '.pdf']);
data=[x(:),y(:)];
dlmwrite([pathname '.txt'],data,'delimiter', '\t');
end