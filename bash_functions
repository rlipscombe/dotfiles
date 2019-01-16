refresh_aws_session_token() {
    if [ $# -ne 1 ]; then
        echo "refresh_aws_session_token TOKEN_CODE"
        return 1
    fi

    local token=$1

    if [ -z "$AWS_MFA_SERIAL" ]; then
        # don't have an MFA set; not relevant
        return 1
    fi

    # Cannot call GetSessionToken with session credentials
    clear_aws_session_token

    # Uses the ambient AWS_PROFILE environment variable and ~/.aws/credentials
    local creds=$(aws sts get-session-token --serial-number $AWS_MFA_SERIAL --token-code $token \
        --output text --query 'Credentials.[AccessKeyId, SecretAccessKey, SessionToken]')

    AWS_ACCESS_KEY_ID=$(echo "$creds" | awk '{print $1}')
    AWS_SECRET_ACCESS_KEY=$(echo "$creds" | awk '{print $2}')
    AWS_SESSION_TOKEN=$(echo "$creds" | awk '{print $3}')
    export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
}

clear_aws_session_token() {
    unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
}

use_aws_profile() {
    if [ $# -ne 1 ]; then
        echo "use_aws_profile PROFILE"
        return 1
    fi

    local profile=$1

    export AWS_PROFILE=$profile

    clear_aws_session_token

    # Look in ~/.aws/mfa for an MFA token matching the profile name
    AWS_MFA_SERIAL=$(grep $AWS_PROFILE ~/.aws/mfa | cut -d= -f2)
    export AWS_MFA_SERIAL       # might be empty; this is fine.
}
