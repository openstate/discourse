import Component from "@glimmer/component";
import { getOwner } from "@ember/owner";
import { service } from "@ember/service";
import PostMetaDataDate from "./meta-data/date";
import PostMetaDataEditsIndicator from "./meta-data/edits-indicator";
import PostMetaDataEmailIndicator from "./meta-data/email-indicator";
import PostMetaDataLanguage from "./meta-data/language";
import PostMetaDataLockedIndicator from "./meta-data/locked-indicator";
import PostMetaDataPosterName from "./meta-data/poster-name";
import PostMetaDataReadIndicator from "./meta-data/read-indicator";
import PostMetaDataReplyToTab from "./meta-data/reply-to-tab";
import PostMetaDataSelectPost from "./meta-data/select-post";
import PostMetaDataWhisperIndicator from "./meta-data/whisper-indicator";

export default class PostMetaData extends Component {
  @service currentUser;

  get displayPosterName() {
    return this.args.displayPosterName ?? true;
  }

  get shouldDisplayEditsIndicator() {
    return this.args.post.version > 1 || this.args.post.wiki;
  }

  get shouldDisplayReplyToTab() {
    return PostMetaDataReplyToTab.shouldRender(this.args, null, getOwner(this));
  }

  get shouldDisplayLanguage() {
    return this.args.post.is_localized && this.args.post.language;
  }

  <template>
    <div class="topic-meta-data" role="heading" aria-level="2">
      {{#if this.displayPosterName}}
        <PostMetaDataPosterName @post={{@post}} />
      {{/if}}

      <div class="post-infos">
        {{#if @post.isWhisper}}
          <PostMetaDataWhisperIndicator @post={{@post}} />
        {{/if}}

        {{#if @post.via_email}}
          <PostMetaDataEmailIndicator
            @post={{@post}}
            @showRawEmail={{@showRawEmail}}
          />
        {{/if}}

        {{#if @post.locked}}
          <PostMetaDataLockedIndicator @post={{@post}} />
        {{/if}}

        {{#if this.shouldDisplayEditsIndicator}}
          <PostMetaDataEditsIndicator
            @post={{@post}}
            @editPost={{@editPost}}
            @showHistory={{@showHistory}}
          />
        {{/if}}

        {{#if @multiSelect}}
          <PostMetaDataSelectPost
            @post={{@post}}
            @selected={{@selected}}
            @selectReplies={{@selectReplies}}
            @selectBelow={{@selectBelow}}
            @togglePostSelection={{@togglePostSelection}}
          />
        {{/if}}

        {{#if this.shouldDisplayReplyToTab}}
          <PostMetaDataReplyToTab
            @post={{@post}}
            @hasRepliesAbove={{@hasRepliesAbove}}
            @isReplyingDirectlyToPostAbove={{@isReplyingDirectlyToPostAbove}}
            @repliesAbove={{@repliesAbove}}
            @toggleReplyAbove={{@toggleReplyAbove}}
          />
        {{/if}}

        {{#if this.shouldDisplayLanguage}}
          <PostMetaDataLanguage @post={{@post}} />
        {{/if}}

        <PostMetaDataDate @post={{@post}} />

        <PostMetaDataReadIndicator @post={{@post}} />
      </div>
    </div>
  </template>
}
