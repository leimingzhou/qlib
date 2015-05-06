classdef SpinCollectionIterator < handle
    %SPINCOLLECTIONITERATOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        spin_collection
        index_list
        cursor
    end
    
    methods
        function obj=SpinCollectionIterator(spin_collection)
            obj.cursor = 1;
            obj.spin_collection = spin_collection;
            obj.index_list = obj.index_gen();
        end
        
        function index = currentIndex(obj)
            index = obj.index_list(obj.cursor, :);
        end
        
        function item = currentItem(obj)
            spin_list=obj.spin_collection.spin_list;
            item = spin_list(obj.currentIndex());
        end
                
        function item = firstItem(obj)
            obj.cursor = 1;
            item = obj.currentItem();
        end
        function item = LastItem(obj)
            obj.cursor = length(obj.index_list);
            item = obj.currentItem();
        end
        
        function item = nextItem(obj)
            if ~obj.isLast()
                obj.cursor = obj.cursor + 1;
                item = obj.currentItem();
            else
                error('already last item');
            end
        end
        function item = prevItem(obj)
            if obj.curser > 1
                obj.cursor = obj.cursor - 1;
                item = obj.currentItem();
            else
                error('already first item.');
            end
        end
        function item=getItem(obj, k)
            obj.setCusor(k);
            item=obj.currentItem();
        end
        
        function res = isLast(obj)
            res = (obj.cursor==obj.getLength());
        end
        function res = isFirst(obj)
            res = (obj.cursor==1);
        end
        function setCursor(obj, k)
            obj.cursor = k;
        end
        function c=getCursor(obj)
            c=obj.cursor;
        end
        function l=getLength(obj)
            l=length(obj.index_list);
        end
    end
    
    methods (Abstract)
        res=index_gen(obj);
    end
    
end
