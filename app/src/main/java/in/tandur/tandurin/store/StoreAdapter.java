package in.tandur.tandurin.store;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.ViewGroup;

import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;

import java.util.Comparator;

public class StoreAdapter extends SortedListAdapter<StoreModel> {
    public StoreAdapter(@NonNull Context context, @NonNull Class<StoreModel> itemClass, @NonNull Comparator<StoreModel> comparator) {
        super(context, itemClass, comparator);
    }

    @NonNull
    @Override
    protected ViewHolder<? extends StoreModel> onCreateViewHolder(@NonNull LayoutInflater inflater, @NonNull ViewGroup parent, int viewType) {
        return null;
    }
}
