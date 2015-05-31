classdef SpinCollection < handle
    %SPINCOLLECTION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        spin_list
        spin_source
    end
    
    methods
        function obj=SpinCollection(spin_source)
            obj.spin_list = {};
            if nargin > 0
                obj.spin_source=spin_source;
                obj.generate()
            end
        end
        
        function generate(obj)
            obj.spin_list = obj.spin_source.generate_spin_collection();
        end
        
        function len=getLength(obj)
            len = length(obj.spin_list);
        end
        
        function dim=getDim(obj)
            dim_list=obj.getDimList;
            dim=prod(dim_list);
        end
        
        function space=getSpace(obj)
            dim_list=obj.getDimList;
            space=model.math.ProductLinearSpace(dim_list);
        end
        
        function dim_list=getDimList(obj)
            len=obj.getLength();
            
            dim_list=zeros(1, len);
            for k=1:len
                dim_list(k)=obj.spin_list{k}.dim;
            end
        end
        
        function pop(obj, spin_idx)
            len=length(spin_idx);
            for k=1:len
                obj.spin_list(spin_idx(k))=[];
            end
        end
        
        
        function mat=calc_mat(obj, spin_index, spin_mat_str)
            if length(spin_index)~=length(spin_mat_str)
                error('index and mat are not equal length.');
            end

            len=length(spin_index);
            mat=cell(1, len);
            for k=1:len
                ss=obj.spin_list(spin_index{k});

                if length(ss) ~= length(spin_mat_str{k})
                    error('size does not match.');
                end

                mat1=1;
                for q=1:length(ss)
                    mat_q=eval(['ss{q}.',spin_mat_str{k}{q}]);
                    mat1=kron(mat1, mat_q);
                end
                mat{k}={mat1};
            end

        end
            
    end
    
end

