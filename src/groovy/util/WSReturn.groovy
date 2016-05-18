package util

/**
 * Created by IntelliJ IDEA.
 * User: maruf
 * Date: 12/30/12
 * Time: 5:50 PM
 * To change this template use File | Settings | File Templates.
 */
class WSReturn {
    int code
    String message
    Object data

    WSReturn(int p_code, String p_message, Object p_data) {
        code = p_code
        message = p_message
        data = p_data
    }

    WSReturn(int p_code, String p_message) {
        code = p_code
        message = p_message
    }
}
