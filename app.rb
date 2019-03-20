require_relative "./repositories/product_repository"
require_relative "./repositories/coin_repository"
require_relative "./controllers/vending_machine_controller"
require_relative "./models/vending_machine"

require_relative "router"


PRODUCT_CSV_FILE = File.join(__dir__, "data/products.csv")
COIN_CSV_FILE = File.join(__dir__, "data/coins.csv")
product_repo = ProductRepository.new(PRODUCT_CSV_FILE)
coin_repo = CoinRepository.new(COIN_CSV_FILE)
vending_machine = VendingMachine.new(product_repo, coin_repo)
vending_machine_controller = VendingMachineController.new(vending_machine)
router = Router.new(vending_machine, vending_machine_controller)
router.run
