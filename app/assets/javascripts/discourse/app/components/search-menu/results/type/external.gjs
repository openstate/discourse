import { htmlSafe } from "@ember/template";
import Blurb from "discourse/components/search-menu/results/blurb";
import { i18n } from "discourse-i18n";

const Post = <template>
  {{htmlSafe @result.dc_title}}
  {{!-- {{i18n "search.post_format" @result}} --}}
  {{!-- <span class="blurb">
      {{ageWithTooltip @result.created_at}}
      <span class="blurb__separator"> - </span>
      {{#if this.siteSettings.use_pg_headlines_for_excerpt}}
        <span>{{htmlSafe @result.blurb}}</span>
      {{else}}
        <span class="blurb__text">
          <HighlightedSearch @string={{@result.blurb}} />
        </span>
      {{/if}}
    </span> --}}
</template>;

export default Post;
