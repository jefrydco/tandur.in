package in.tandur.tandurin.store;

import android.support.annotation.NonNull;
import android.view.View;

import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;

public class StoreViewHolder extends SortedListAdapter.ViewHolder<StoreModel> {
    public StoreViewHolder(@NonNull View itemView) {
        super(itemView);
    }

    @Override
    protected void performBind(@NonNull StoreModel item) {

    }
}
