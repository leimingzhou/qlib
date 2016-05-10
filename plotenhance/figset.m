function figset(labelx,labely,labelfont,axisfont,pathname,data)
%Script figsetsave sets and save the fiure just plotted,
%for scientific paper in right size with all figure elements.
%
%   See also: ....

%fig settings
set(gcf,'PaperSize',[14.4 10.5],'PaperPosition',[0.4, 0.1, 14, 10])%A6 paper
xlabel(labelx,'FontSize',labelfont,'Interpreter','tex')
ylabel(labely,'FontSize',labelfont,'Interpreter','tex');
grid on
set(gca,'FontName','Times New Roman','FontSize',axisfont)
if nargin>4
saveas(gcf, [pathname, '.pdf']);
end
if nargin>5
dlmwrite([pathname '.txt'],data,'delimiter', '\t');
end
end