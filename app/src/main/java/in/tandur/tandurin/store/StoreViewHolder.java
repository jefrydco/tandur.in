package in.tandur.tandurin.store;

import android.support.annotation.NonNull;
import android.view.View;

import com.bumptech.glide.request.RequestOptions;
import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;

import in.tandur.tandurin.R;
import in.tandur.tandurin.databinding.ItemStoreBinding;
import in.tandur.tandurin.utils.GlideApp;

import static com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions.withCrossFade;

public class StoreViewHolder extends SortedListAdapter.ViewHolder<StoreModel> {

    private ItemStoreBinding mItemStoreBinding;

    StoreViewHolder(ItemStoreBinding mItemStoreBinding) {
        super(mItemStoreBinding.getRoot());
        this.mItemStoreBinding = mItemStoreBinding;
    }

    @Override
    protected void performBind(@NonNull StoreModel item) {
        GlideApp.with(mItemStoreBinding.itemStoreImageViewThumbnail)
                .load(item.getImageUrl())
                .placeholder(R.drawable.ic_local_florist_pink_64dp)
                .override(64, 64)
                .centerCrop()
                .apply(RequestOptions.circleCropTransform())
                .transition(withCrossFade())
                .into(mItemStoreBinding.itemStoreImageViewThumbnail);
        mItemStoreBinding.setStore(item);
    }
}
