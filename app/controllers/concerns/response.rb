module Response
    # :ok => 200
    # json_response is method
    # object, status are params
    def json_response(object, status = :ok)
        render json: object, status: status
    end
end