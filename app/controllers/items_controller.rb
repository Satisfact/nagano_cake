class ItemsController < ApplicationController
    def top
        @quantity = Item.count
        #kaminariつける
    end
    
    def index
        #kaminariつける
        @sweet_items = Item.all
    end
    
    def show
        @sweet_item = Item.find(params[:id])
        @cart_item = CartItem.new
        
    end
    
    #下管理者
    #このコントローラーをコピーして管理者のところに貼り付ける？（タイトル注意）

    def new
    end

    def edit
    end

    def create
    end

    def update
    end
    
end
