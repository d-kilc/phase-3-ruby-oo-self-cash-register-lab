class CashRegister
    attr_accessor :total, :discount, :items, :last_total

    def initialize discount=nil
        @total = 0
        @discount = discount
        @items = []
        @last_total = 0
    end

    def add_item title, price, quantity=nil
        if quantity != nil
            self.total += price * quantity
            self.last_total = price * quantity
            i = 0
            while i < quantity
                self.items << title
                i+=1
            end
        else
            self.total += price
            self.last_total = price
            self.items << title
        end
    end

    def apply_discount
        if self.discount != nil
            self.total = self.total - ((self.discount.to_f / 100) * self.total)
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_total
    end
end