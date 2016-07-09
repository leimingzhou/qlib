function figset(labelx,labely,labelfont,axisfont,pathname,data)
%Script figsetsave sets and save the fiure just plotted,
%for scientific paper in right size with all figure elements.
%
%   See also: ....

%fig settings
grid on
set(gcf,'PaperSize',[14.4 10.5],'PaperPosition',[0.0, 0.0, 14.4, 10.5])%A6 paper
% set(gcf,'PaperSize',[21.0,14.4],'PaperPosition',[0.0, 0.0, 21.0,14.4])%A5 paper

set(gca,'Position',[0.20,0.22,0.75,0.73],'Linewidth',2) %for real number
set(gca,'Position',[0.21,0.21,0.75,0.71])               % for y aix 10^n

% set(gcf,'PaperSize',[24.4 10.5],'PaperPosition',[0.0, 0.0, 24.4, 10.5])
% set(gca,'Position',[0.11,0.23,0.84,0.72],'Linewidth',2) %for real number

xlabel(labelx,'FontSize',labelfont,'Interpreter','tex')
ylabel(labely,'FontSize',labelfont,'Interpreter','tex');
set(gca,'FontName','Times New Roman','FontSize',axisfont)

if nargin>4
saveas(gcf, [pathname, '.pdf']);
end
if nargin>5
dlmwrite([pathname '.txt'],data,'delimiter', '\t');
end
end