% function figset(fig)
%figet function set the fiure with handle h,
%for scientific paper in right size with all figure elements.
%
%   See also: savez1

set(gcf,'PaperSize',[21 16],'PaperPosition',[0.6, 0.6, 20, 15])
set(gca,'LineWidth',2)
xlabel('R/\mum','FontSize',48,'Interpreter','tex')
ylabel('|E|^2','FontSize',48,'Interpreter','tex')
set(gca,'FontName','Times New Roman','FontSize',36)
grid on
%         h = legend(legend1,legend2,1);
%         set(h,'Interpreter','tex');
%         title('lifetime');

% end