import { htmlSafe } from "@ember/template";
import Blurb from "discourse/components/search-menu/results/blurb";
import { i18n } from "discourse-i18n";

const Post = <template>
  <style>
    .osf-topic {
      text-align: left;
    }

    .osf-topic a {
      display: block;
      color: inherit;
      margin-bottom: 0.75rem;
    }

    .osf-publisher-name {
      background-color: #25aae2;
      border-radius: 1em;
      padding-inline: 0.75em;
      padding-block: 0.1em;
      width: max-content;
      font-size: 0.8em;
      color: white;
    }

    .osf-description {
      font-size: var(--font-0);
      line-height: var(--line-height-large);
      color: var(--primary-medium);
      margin-block: 0.5rem;
      text-align: left !important;
      display: -webkit-box;
      -webkit-line-clamp: 3; /* Number of lines to show */
      -webkit-box-orient: vertical;
      overflow: hidden;
      text-overflow: ellipsis; /* Adds the ellipsis (...) at the end */
    }

    .osf-description em {
      font-weight: 600;
    }

    .osf-title {
      font-size: var(--font-up-1-rem);
      line-height: var(--line-height-medium);
      color: var(--tertiary);
      margin-block: 0.5rem;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      text-align: left;
    }

    .osf-badge {
      display: flex;
      align-items: center;
      gap: 0.25rem;
      font-weight: 500;
      font-size: var(--font-down-1);
      line-height: var(--line-height-large);
      color: var(--primary-medium);
    }

    .osf-badge::before {
      content: "";
      background: #25aae2;
      flex: 0 0 auto;
      width: 0.625rem;
      height: 0.625rem;
    }
  </style>
  {{!-- {{htmlSafe @result.dc_title}} --}}
  <div class="osf-topic">
    <a href={{@result.dc_source}} target="_blank">
      <p class="osf-title">{{htmlSafe @result.dc_title}}</p>

      <span class="osf-badge"><span
          class="badge-category__name"
        >{{@result.dc_publisher_name}}</span></span>
      {{!-- <p class="osf-publisher-name"><b
                              >{{document.dc_publisher_name}}</b></p> --}}
      <p class="osf-description">{{htmlSafe @result.dc_description}}</p>

    </a>

  </div>
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
