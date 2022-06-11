% rebase("base.tpl", title="Edit recording entry")
<div class="row">
    <h1 class="col-12">Recording No. {{item.id}}</h1>
</div>
<form>
<div class="row g-2">
<div class="form-floating col-12">
    <input type="date" class="form-control" id="floatingInput_recording_date"
    % if item.recording_date is not None:
    value="{{item.recording_date}}"
    % end
    placeholder="recording date"/>
    <label for="floatingInput_recording_date">recording date</label>
</div>

<div class="form-floating col-12">
    <input type="text" class="form-control" id="floatingInput_title"
    % if item.title is not None:
    value="{{item.title}}"
    % end
    placeholder="title"/>
    <label for="floatingInput_title">title</label>
</div>

<div class="form-floating col-12">
    <input type="text" class="form-control" id="floatingInput_speaker"
    % if item.speaker is not None:
    value="{{item.speaker}}"
    % end
    placeholder="speaker"/>
    <label for="floatingInput_speaker">speaker</label>
</div>

<div class="form-floating col-12">
    <input type="text" class="form-control" id="floatingInput_album"
    % if item.album is not None:
    value="{{item.album}}"
    % end
    placeholder="album"/>
    <label for="floatingInput_album">album</label>
</div>

<div class="form-floating col-12">
    <textarea class="form-control" id="floatingInput_comment"
    placeholder="comment" >
        % if item.album is not None:
        {{item.comment}}
        % end
    </textarea>
    <label for="floatingInput_comment">comment</label>
</div>

    <div class="input-group">
    <!-- Public Speaker -->
    <div class="col-12 p-3" id="radioPublicSpeaker">
        <label for="radioPublicSpeaker">public (speaker):</label>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="radioPublicSpeaker"
                   id="radioPublicSpeakerYes" value="yes"
            % if item.public_speaker == True:
            checked
            % end
            />
            <label class="form-check-label" for="radioPublicSpeakerYes">yes</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="radioPublicSpeaker"
                   id="radioPublicSpeakerNo" value="no"
            % if item.public_speaker == False:
            checked
            % end
            />
            <label class="form-check-label" for="radioPublicSpeakerNo">no</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="radioPublicSpeaker"
                   id="radioPublicSpeakerUnknown" value="unknown"
            % if item.public_speaker == None:
            checked
            % end
            />
            <label class="form-check-label" for="radioPublicSpeakerUnknown">unknown</label>
        </div>
    </div>

    <!-- Public Protocol -->
    <div class="col-12 p-3" id="radioPublicProtocol">
        <label for="radioPublicProtocol">public (protocol):</label>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="radioPublicProtocol"
                   id="radioPublicProtocolYes" value="yes"
                   onclick="document.getElementById('floatingInput_protocol_date').enable();"
            % if item.public_protocol == True:
            checked
            % end
            />
            <label class="form-check-label" for="radioPublicProtocolYes">yes</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="radioPublicProtocol"
                   id="radioPublicProtocolNo" value="no"
            % if item.public_protocol == False:
            checked
            % end
            />
            <label class="form-check-label" for="radioPublicProtocolNo">no</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="radioPublicProtocol"
                   id="radioPublicProtocolUnknown" value="unknown"
            % if item.public_protocol == None:
            checked
            % end
            />
            <label class="form-check-label" for="radioPublicProtocolUnknown">unknown</label>
        </div>
    </div>

    <div class="form-floating col-12">
        <input type="date" class="form-control" id="floatingInput_protocol_date"
        % if item.public_protocol is None:
        disabled
        %end
        % if item.protocol_date is not None:
        value="{{item.protocol_date}}"
        % end
        placeholder="protocol date"/>
        <label for="floatingInput_protocol_date">protocol date</label>
    </div>
    </div>

    <div class="form-check">
        <input class="form-check-input" type="checkbox" id="checkPublished"
        %if item.published:
        value="true"
        % else:
        value="false"
        %end
        />
        <label class="form-check-label" for="checkPublished">
            published
        </label>


        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <a href="/" class="btn btn-secondary">cancel</a>
            <input class="btn btn-danger" type="reset" value="reset"/>
            <input class="btn btn-primary" type="submit" value="save"/>
        </div>
</div>




</div>
</form>