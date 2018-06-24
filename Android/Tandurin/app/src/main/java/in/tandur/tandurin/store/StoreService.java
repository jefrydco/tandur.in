package in.tandur.tandurin.store;

import retrofit2.Call;
import retrofit2.http.GET;

public interface StoreService {

    @GET("list_shop/api.php?apicall=get_store")
    Call<String> getStoreList();
}
