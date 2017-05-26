class Sale::Create
  attr_reader :spreadsheet, :not_imported, :amount

  RULES =  { buyer: 0, description: 1, price: 2, quantity: 3, address: 4, provider: 5 }.freeze

  def self.call(params)
    this = new(params)
    this.call
    this
  end

  def initialize(spreadsheet)
    @spreadsheet = spreadsheet
    @not_imported = []
    @amount = 0
  end

  def call
    import_sales!
  end

  def import_sales!
    linha = 0
    f = File.open(spreadsheet.path, 'r')
    f.each_line { |line|
      if linha > 0
        line.delete!("\n")
        row = line.split("\t")
        sale = Sale.create(get_sale(row))
        if sale.errors.any?
          not_imported << {row: linha, errors: sale.errors}
        else
          @amount += sale.price * sale.quantity
        end
      end
      linha += 1
    }
    f.close
  end
  
  private

  def get_sale(data)
    sale = {}
    RULES.map { |k, v|
      sale[k] = data[v]
    }
    sale
  end

end
