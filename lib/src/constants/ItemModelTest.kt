
import com.google.gson.annotations.SerializedName

data class ItemModelTest(
    @SerializedName("message")
    var message: String = "",
    @SerializedName("result")
    var result: Result = Result()
) {
    data class Result(
        @SerializedName("Beverages")
        var beverages: List<Beverage> = listOf(),
        @SerializedName("Fruits")
        var fruits: List<Fruit> = listOf()
    ) {
        data class Beverage(
            @SerializedName("category_id")
            var categoryId: Int = 0,
            @SerializedName("detail")
            var detail: Detail = Detail(),
            @SerializedName("id")
            var id: Int = 0,
            @SerializedName("name")
            var name: String = "",
            @SerializedName("net_weight")
            var netWeight: NetWeight = NetWeight(),
            @SerializedName("net_weight_id")
            var netWeightId: Int = 0,
            @SerializedName("packaging")
            var packaging: String = "",
            @SerializedName("price")
            var price: Price = Price(),
            @SerializedName("quantity")
            var quantity: Int = 0
        ) {
            data class Detail(
                @SerializedName("barcode")
                var barcode: String = "",
                @SerializedName("description")
                var description: String = "",
                @SerializedName("is_visible")
                var isVisible: Int = 0,
                @SerializedName("origin")
                var origin: String = "",
                @SerializedName("product_id")
                var productId: Int = 0,
                @SerializedName("thumbnail")
                var thumbnail: String = ""
            )

            data class NetWeight(
                @SerializedName("id")
                var id: Int = 0,
                @SerializedName("unit_id")
                var unitId: Int = 0,
                @SerializedName("value")
                var value: Int = 0
            )

            data class Price(
                @SerializedName("id")
                var id: Int = 0,
                @SerializedName("product_id")
                var productId: Int = 0,
                @SerializedName("value")
                var value: Int = 0
            )
        }

        data class Fruit(
            @SerializedName("category_id")
            var categoryId: Int = 0,
            @SerializedName("detail")
            var detail: Detail = Detail(),
            @SerializedName("id")
            var id: Int = 0,
            @SerializedName("name")
            var name: String = "",
            @SerializedName("net_weight")
            var netWeight: NetWeight = NetWeight(),
            @SerializedName("net_weight_id")
            var netWeightId: Int = 0,
            @SerializedName("packaging")
            var packaging: String = "",
            @SerializedName("price")
            var price: Price = Price(),
            @SerializedName("quantity")
            var quantity: Int = 0
        ) {
            data class Detail(
                @SerializedName("barcode")
                var barcode: String = "",
                @SerializedName("description")
                var description: String = "",
                @SerializedName("is_visible")
                var isVisible: Int = 0,
                @SerializedName("origin")
                var origin: String = "",
                @SerializedName("product_id")
                var productId: Int = 0,
                @SerializedName("thumbnail")
                var thumbnail: String = ""
            )

            data class NetWeight(
                @SerializedName("id")
                var id: Int = 0,
                @SerializedName("unit_id")
                var unitId: Int = 0,
                @SerializedName("value")
                var value: Int = 0
            )

            data class Price(
                @SerializedName("id")
                var id: Int = 0,
                @SerializedName("product_id")
                var productId: Int = 0,
                @SerializedName("value")
                var value: Int = 0
            )
        }
    }
}