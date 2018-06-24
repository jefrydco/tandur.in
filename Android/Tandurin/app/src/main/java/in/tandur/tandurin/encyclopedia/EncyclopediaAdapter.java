package in.tandur.tandurin.encyclopedia;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.ViewGroup;

import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;
import in.tandur.tandurin.databinding.ItemEncyclopediaBinding;

import java.util.Comparator;

public class EncyclopediaAdapter extends SortedListAdapter<EncyclopediaModel> {

    public EncyclopediaAdapter(@NonNull Context context, @NonNull Class<EncyclopediaModel> itemClass, @NonNull Comparator<EncyclopediaModel> comparator) {
        super(context, EncyclopediaModel.class, comparator);
    }

    @NonNull
    @Override
    protected ViewHolder<? extends EncyclopediaModel> onCreateViewHolder(@NonNull LayoutInflater inflater, @NonNull ViewGroup parent, int viewType) {
        final ItemEncyclopediaBinding itemEncyclopediaBinding = ItemEncyclopediaBinding.inflate(inflater, parent, false);
        return new EncyclopediaViewHolder(itemEncyclopediaBinding);
    }
}
