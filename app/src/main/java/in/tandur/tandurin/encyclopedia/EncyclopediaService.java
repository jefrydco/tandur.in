package in.tandur.tandurin.encyclopedia;

import retrofit2.Call;
import retrofit2.http.GET;

public interface EncyclopediaService {

    @GET("list_ency/api.php?apicall=get_ency")
    Call<String> getEncyclopediaList();
}
