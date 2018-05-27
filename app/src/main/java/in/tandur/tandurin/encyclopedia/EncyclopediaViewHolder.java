package in.tandur.tandurin.encyclopedia;

import android.support.annotation.NonNull;

import com.bumptech.glide.request.RequestOptions;
import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;

import in.tandur.tandurin.R;
import in.tandur.tandurin.databinding.ItemEncyclopediaBinding;
import in.tandur.tandurin.utils.GlideApp;
import static com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions.withCrossFade;

public class EncyclopediaViewHolder extends SortedListAdapter.ViewHolder<EncyclopediaModel> {

    private ItemEncyclopediaBinding mItemEncylopediaBinding;

    EncyclopediaViewHolder(ItemEncyclopediaBinding mItemEncylopediaBinding) {
        super(mItemEncylopediaBinding.getRoot());
        this.mItemEncylopediaBinding = mItemEncylopediaBinding;
    }

    @Override
    protected void performBind(@NonNull EncyclopediaModel item) {
        GlideApp.with(mItemEncylopediaBinding.itemEncyclopediaImageViewThumbnail)
                .load(item.getImageUrl())
                .placeholder(R.drawable.ic_local_florist_pink_64dp)
                .override(64, 64)
                .centerCrop()
                .apply(RequestOptions.circleCropTransform())
                .transition(withCrossFade())
                .into(mItemEncylopediaBinding.itemEncyclopediaImageViewThumbnail);
        mItemEncylopediaBinding.setEncyclopedia(item);
    }
}
