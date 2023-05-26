%% Author: AE. Arslan
% This script saves all open figures as svg, fig, and png to a newly created
% folder, resized according to subplot structures


runn=0;

while(exist(sprintf('%i__Figgtempdir',runn),'dir'))
runn=runn+1;
end

FolderName =sprintf('%i__Figgtempdir',runn) % Your destination folder
mkdir (sprintf('%i__Figgtempdir',runn));
cd (FolderName)

% FigList = sort(findobj(allchild(0), 'flat', 'Type', 'figure'));
FigList=handle( sort( double(findall(0, 'type', 'figure') ) ))
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  if(size(FigList(iFig).Children,1)==6)
%        FigList(iFig).Position = [-2279          81        3512         896];
              FigList(iFig).Position = [-2279         -400        3512         2900];
  elseif(size(FigList(iFig).Children,1)==8)
     FigList(iFig).Position = [6  -844        2000        1836];
  else
       FigList(iFig).Position = [0           0        1120        1000];
%         FigList(iFig).Position = [1 62 1920 942];
  end
      FigName   = get(FigHandle, 'Name');
   set(findall(FigList(iFig), 'Type', 'Line'),'LineWidth',1);
   set(findall(FigList(iFig), '-property','FontSize'),'FontSize',13);
   grid on; grid minor;
%   savefig(FigHandle, fullfile(FolderName, FigName, '.fig'));
saveas(FigList(iFig),[FigName 'run' num2str(runn) '__' num2str(FigList(iFig).Number) '.svg'])
 saveas(FigList(iFig),[FigName 'run' num2str(runn) '__' num2str(FigList(iFig).Number) '.fig']) % Comment this line if the .fig is large and you don't want to keep it
saveas(FigList(iFig),[FigName 'run' num2str(runn) '__' num2str(FigList(iFig).Number) '.png'])
% saveas(FigList(iFig),[FigName 'run' num2str(runn) '__' num2str(FigList(iFig).Number) '.png'])
% export_fig(FigList(iFig),[FigName 'run' num2str(runn) '__' num2str(FigList(iFig).Number) '.png'])
% export_fig

end
% runn = runn+1

cd ..
